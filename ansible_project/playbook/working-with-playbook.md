## templating

* ansible uses jinja 2 templating ti ebavke dynaimc expressions and  access to variables and facts
* All templating happens on the ansible control node before the task is sent and executed on the target machine
* its also limits the amount of data ansible passes to the target machine and passes only the information needed.


