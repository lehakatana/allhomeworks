#!/bin/bash

vagrant up
ansible-playbook main.yml --tags homework
