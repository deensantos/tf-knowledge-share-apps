# Terraform Hands on Training

**Session 1**

Objective: 
Write the TF code and deploy the Application infrastructure requested by the 'client': https://docs.google.com/spreadsheets/d/1O0_jQfhlU4Ks4g2BzlTGUVUbD1a-67N4sqPr39nnt-Y/edit?usp=sharing

Steps:

1. Clone this repo to your local machine
2. Create the directory structure for the new application
   - Decide how many folders to create. Ex: Prod, Dev, Test
   - Decide how many files to break the TF files into. Ex: App.tf Ebs.tf Alb.tf
3. Determine what resources should be written first. That must be decided based on their dependencies. For example, an instance cannot be created without a network interface value, therefore to have a better work flow write the network interface first.
4. To reduce debugging time, after writing data blocks, test the resources data are succesfully pulled out by using output blocks.

**Session 2**

Objective: 
Understand Drifts and correct them.

1. Clone the repo to your local machine
2. Deploy the APP000
3. Copy all deployment outputs to the top of the drifts.zsh file
4. run the script drifts.zsh
5. Try increasing the non root volume of the database instance by 10GB
6. Review and fix all drifts, so the change on step 5 can be succesfully executed

