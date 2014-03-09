The objective of this project is to add Perforce support to Phabricator.

## Contributing

```bash
git clone git@github.com:gnawhleinad/phabricator-p4.git
vagrant up
```

This will install phabricator and a perforce server on the vagrant box. Some important paths:

* Phabricator is installed at `/opt/phabricator`
* Perforce is installed at `/opt/p4`
* The perforce depot is at `/home/vagrant/depot`

To use phabricator from the host machine, you will also need to edit your host file to
redirect `phabricator-p4.ohana` to `127.0.0.1`.

See https://secure.phabricator.com/book/phabricator/article/installation_guide/