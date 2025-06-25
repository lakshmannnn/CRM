@echo off
cd C:\Automation\Robot\JenkinsAuto\tests
call	robot -d results/taskScheduler -i 123 -v BROWSER:chrome tests/crm.robot 