# drake
drake, or distributed Rake, is a Ruby-based platform for daemonless configuration of Linux server environments

## It's not Capistrano
* **Capistrano uses a DSL for defining tasks to run. Drake uses pure Rake.**
<br/>We want drake to be as easy to learn as possible. Rake presents a very simple DSL for build tasks and dependency trees. Drake simply gives you the tools to run Rake across multiple remote systems, as quickly as possible.
* **Capistrano embraces web developers. Drake embraces sysadmins.**
<br/>Capistrano has evolved to be most useful for deployment of Ruby web apps, with extensions for handling a multitude of frameworks. Drake features a much wider set of capabilities out of the box, by focusing on what a sysadmin might need to do in the course of configuring server systems.

## It's not Ansible
* **Ansible uses YAML. Drake uses JSON.**
<br/>This might not seem like a big deal to the seasoned YAML user, but having strict rules about whitespace can often create unexpected behaviors when writing Ansible scripts. Drake embraces Ruby's native support for JSON hashes to allow for safe, simple configuration of drake and the tasks is runs.
* **Ansible tasks are YAML. Drake tasks are Ruby.**
<br/>When writing tasks for Drake, you are writing pure Ruby code with Rake for structure. No DSLs, no YAML, no nonsense. Drake provides convenient functions for a variety of actions, but everything you will write is Ruby.
* **Ansible runs Playbooks. Drake runs tasks.**
<br/>Ansible requires you to run an entire Playbook or to use conditional logic in the roles to prevent re-execution of tasks. Drake uses Rake command syntax to allow for running any single task in any Rakefile, just as if you were calling Rake directly. 

## It's drake!

### Pure Ruby, Pure Rake, No nonsense!!
