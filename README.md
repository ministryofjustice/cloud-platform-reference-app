# cloud-platform-reference-app
Functional skeleton for an app that employs secrets management, k8s, AWS resources

## Quickstart
* Clone this repo ```git clone git@github.com:ministryofjustice/cloud-platform-reference-app.git```
* ```cd cloud-platform-reference-app```
* ```git pull```

## Git-Crypt

### Prerequisites:

##### If you do not have an existing gpg-key:

**• Install gpg and git-crypt:**
* ```brew install gpg```
* ```install git-crypt```
* ```gpg --gen-key```
* Accept all of the default value options

**• View your public key:**
* ```gpg --armor --output pubkey.txt --export 'Your Name<Your Email@digital.justice.gov.uk>'```

**• Find the key ID for your public key:**
* ```gpg --keyid-format long --list-keys 'Your Name <Your Email@digital.justice.gov.uk>'```
* ```pub   4096R/PUBKEYID 2016-09-26```
* ```uid       [ultimate] Your Name <Your Email@digital.justice.gov.uk>```
* ```sub   4096R/SUBKEYID 2016-09-26```

In the above example PUBKEYID is the key id you want to send.

**• Push your public key to a public key server (gpgtools (https://gpgtools.org/) does it for you, also see [here](https://www.gnupg.org/gph/en/manual/x56.html) to exchange keys):**
* ```gpg --send-keys PUBKEYID```

**• Add your GPG key to GitHub:**
* Go to the following location : https://github.com/settings/keys
* Hit the 'New GPG Key' button.
* In the text box that appear, paste contents of your public key file.
* Get you key trusted by an existing member of the CloudPlatforms team.

##### If your gpg-key already exists:
* Push your public key to a public key server (gpgtools (https://gpgtools.org/) does it for you).
* Get your key trusted by an existing member of the CloudPlatforms team).

##### If the repos has already been set up by another user, 
* get you key added (and trusted) on that repos by, someone that already has their key added to that repos. If you don't you will not be able to decrypt encrypted content in the repo.


**• To decrypt an existing secrets file:**
* Once the key has been trusted:
  *  ```git-pull```
  *  ```git-crypt unlock```


### Initial set up for using git-crypt for storing secrets when initially creating your repos:  

* Configure a repository to use git-crypt:

  *  ```cd repos```
  *  ```git-crypt init```

* Specify files to encrypt by creating a .gitattributes file with similar to the following example:

  * ```*secrets* filter=git-crypt diff=git-crypt```

In the above example the wildcards mean that any file with "secrets" in the file name will be encrypted in both this and any sub-directory

Like a .gitignore file, it should be checked into the repository.
Make sure you don't accidentally encrypt the .gitattributes file itself
(or other git files like .gitignore or .gitmodules).  Make sure your
.gitattributes rules are in place *before* you add sensitive files, or
those files won't be encrypted!

Create your secrets file i.e "secrets.txt"

Before pushing to your github repository - the following commands should be carried out (to avoid any mistakes!)

* Display a list of files in the repository, with their status (encrypted or unencrypted).
  * ```git-crypt status```
* Show only encrypted files.
  * ```git-crypt status -e``` 
* Show only unencrypted files.
  * ```git-crypt status -u```
* Encrypt files that should be encrypted but were committed to the repository or added to the index without encryption. (This can happen if a file is added before git-crypt is initialized or before the file is added to the gitattributes file.)
  * ```git-crypt status -f, --fix```


After git-crypt is set up (either with
`git-crypt init` or `git-crypt unlock`), git can be used normally -
encryption and decryption happen transparently.
