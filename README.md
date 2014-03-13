The objective of this project is to add Perforce support to Phabricator.

## Contributing

```bash
git clone git@github.com:gnawhleinad/phabricator-p4.git
vagrant up
```

This will install phabricator and a perforce server on the vagrant box. Some
important paths:

* Phabricator is installed at `/opt/phabricator`
* Perforce is installed at `/opt/p4`
* The perforce depot is at `/home/vagrant/depot`

To use phabricator from the host machine, you will also need to edit your host
file to redirect `phabricator-p4.ohana` to `127.0.0.1`.  After doing that, you
can access phabricator at `http://phabricator-p4.ohana:8080` on your host
machine.

See https://secure.phabricator.com/book/phabricator/article/installation_guide/

## Next steps

Read the [documentation](https://secure.phabricator.com/book/phabricator/article/arcanist_diff/)
on how to use arcanist.

The next work to be done is to figure out how to add p4 support to the
[arcanist](https://github.com/facebook/arcanist) command line tool. Ideally we
think we want to be able to create new code reviews from perforce changelists by
runnning:

    $ arc diff 1234

That would create a differential code review for whatever's in changelist 1234.
