\# terraform_template_awsec2_in_acloudguru_sandbox <br />
\# terraform template to deploy 2 ubuntu 20.04 lts ec2 instances with predefined root user and ssh key in acloudguru sandbox <br />
\# for the template to work (in a tested working environment), it is assumed that you have: <br />
\# (1) an acloudguru account that gives you access to acloudguru sandbox <br />
\# (2) local windows wsl ubuntu 20.04 lts terminal to run terraform commands <br />
\# (3) local windows vsc linked to wsl ubuntu 20.04 lts to preview (and amend) terraform template <br />
\# (4) and more importantly, no evil intention to 'abuse' the acloudguru sandbox <br />
\# steps to create aws ec2 instances in acloudguru sandbox: <br />
\# (1) login to you acloudguru account and navigate to acloudguru sandbox (ie https://learn.acloud.guru/cloud-playground/cloud-sandboxes) <br />
\# (2) select aws sandbox and copy the auto generated aws access and secret keys (follow the acloudguru instruction to login into aws console via internet browser but you need not login to aws console to execute this terraform to provision the ec2 instances) <br />
\# (3) copy and paste the aws access and secret keys into the appropriate fields in the main.tf file (using vsc for convenience) <br />
\# (4) run the usual terraform commands in your local wsl ubuntu 20.04 lts - 'fmt', 'validate', 'plan' and 'apply' (and lastly, after proceeding to step no. 10 herein, 'destroy') <br />
<br />
\# feel free to de-construct and re-construct the template and improve on the same by collaborating with the view of developing a shared knowledge pool
