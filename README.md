# offstack
Stack Exchange in offline mode using Stack Exchange Data Dump.

It is massively based upon [Solr-Jetty-Maven](http://projects.freelibrary.info/solr-jetty-maven/) for the Solr instance, and [Stackdump](https://bitbucket.org/samuel.lai/stackdump) for the Python front-end and indexing.

# Installation
## Requirements
You should have the following installed and ready to use:
* Java JDK (>= 1.7)
* Maven (>= 3.2.0)
* Python (>= 2.5)
  * Packages: requests, bottle, jinja2, sqlobject, iso8601, markdown, cherrypy, pysolr

Tip : to install Python packages, use pip:
```bash
sudo pip install requests bottle jinja2 sqlobject iso8601 markdown cherrypy, pysolr
```

## Data Dump
You need to download [Stack Exchange Data Dump](https://archive.org/details/stackexchange). I recommend using the provided torrent file.

## Starting Solr server
To start Solr embedded in Jetty, simply use:
```bash
# Running start_solr.sh
./start_solr.sh

# Run Maven command directly
mvn install jetty:run
```

## Indexing the dump
To index the desired website, you have two options:

Run import_all.sh script:
```bash
./import_all.sh <Path to Stack Exchange Data Dump>
```

Run a single import:
```bash
./manage.sh import_site <Path to XML files>
```

# Usage
Once data are indexed, the only thing to do is starting the Python front-end with *start_web.sh* script.
