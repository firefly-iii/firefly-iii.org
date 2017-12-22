#!/bin/bash
vagrant halt
vagrant box update
vagrant destroy --force
vagrant up