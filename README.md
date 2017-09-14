# Web-Vuln

***
Web-Vuln is an intentionally vulnerable virtualbox image DVWA, Mutillidae 2, and WebGoat pre-installed on a LEMP stack. The virtual machine is provisioned using ````Vagrant````, hence pre-requisites to Web-Vuln are [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html). In addition, `vagrant-reload` and `vagrant-vbguest` plugins should be installed through vagrant.

### Pre-requisites
* Virtualbox: https://www.vagrantup.com/downloads.html
* Vagrant: https://www.vagrantup.com/downloads.html
  - Plugins: `vagrant-reload` and `vagrant-vbguest`
* CAPTCHA keys for DVWA Insecure CAPTCHA module. 
  - In order to enable the DVWA Insecure CAPTCHA module, you will need to generate your own keys at https://www.google.com/recaptcha/admin/create and paste those keys in `resources/config.inc.php` at lines `29` and `30`.
  
### Limitations
Barring no errors, an ubuntu based cli virtualbox with hostname `web-vuln` will be provisioned with three intentionally vulnerable web applications. Note: `web-vuln` does not have a GUI interface (and is not intended to be used in that manner either). The provision has been successfully tested on both Linux and Windows 10 (through PowerShell) hosts and may also work on a Mac out of the book (not tested).

### Warning
Do not expose this virtual machine on public interfaces. By default, two interfaces, a `nat` interface on the 10.0.2/24 subnet and a `host-only` interface on 172.28.128/24 subnet are enabled during the provisioning. The `nat` interface is strictly used during provision for bootstrapping purposes and can be (and highly recommended) to be disabled through virtualbox afterwards.

### Installation
Once the pre-requisites are met, clone the repository and type `vagrant up`. The default username:password combination is `ubuntu:vagrant`, if necessary. The intention is to interact with the vulnerable web applications through a web browser on the virtualbox host, thus there isn't (and shouldn't) be a need to specifically login. 

### Default ports
* DVWA: 80
  * admin/password
* Mutillidae: 8088 -- Click the `setup/reset the DB` link at the top of the page to initialize the database
* WebGoat: 8080/WebGoat
> example: Visit 172.28.128.5:8080/WebGoat from the host computer to visit the WebGoat interface.

### Credit
Credit goes to the people behind [DVWA](http://www.dvwa.co.uk/), [Mutillidae](https://sourceforge.net/projects/mutillidae/), and [WebGoat](https://github.com/WebGoat/WebGoat/wiki). 

# Have Fun hacking (and learning) web applications security. 
