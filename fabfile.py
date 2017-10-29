from __future__ import with_statement
from fabric.api import *
from fabric.contrib.console import confirm
from fabric.contrib.files import exists
import os

def deploy(branch='master', directory='alla_breve'):
    with settings(host_string='root@51.15.85.208'):
        deploy_process(branch, directory, compile)

def deploy_process(branch, directory, compile):
    code_dir = '/var/www/' + directory
    service = directory + ".service"
    # sidekiq_service = directory + "_sidekiq.service"
    with settings(warn_only=True):
        if run("cd %s && git fetch origin" % code_dir).failed:
            run("git clone git@github.com:beaver1992/alla_breve.git %s" % code_dir)
    with cd(code_dir):
        run("git fetch origin")
        run("git checkout -f "+branch)
        run("git pull origin "+branch)
        if not exists("tmp/pids"):
            run("mkdir -p tmp/pids")

        run('bundle install')
        run('rails tmp:cache:clear db:migrate assets:precompile RAILS_ENV=production')

        run('systemctl restart '+service)

