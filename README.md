# The Root POM

This POM is designed to be the topmost parent (root) of the pom inheritance hierarchy.

Its primary role is to hold shared, generic settings, usable by any type of derived project.

Additionally, it has some support for releases performed by `maven-releases-plugin` (aka MRP), helping the `pom.xml` files
to avoid direct references to concrete Nexus (or, Maven Repository Manager) instances.

Releases of this project are meant to be *very infrequent*.

## POM hierarchy

Following POM hierarchy proved to be very flexible on many long-term projects:

* **The Root POM** - a pom like this one - topmost, has no parent pom
* **Project POM** - derived directly from `corporate-pom` - each multi-module project should have such a pom, derived by all its modules
* **Module POM** - derived directly or indirectly from the *Project POM*; for single-pom projects, it is the same file as *Project POM*.

## What is in here

A lot of defaults. Almost everything can be overriden in project poms.

**Definitions**

* organization name and URL
* license

**Build configuration**

* `pluginManagement` - default versions and configuration of most important plugins; note that it is not necessary to
    specify all plugins ever used; each build is responsible for its own versions anyway
* `maven-enforcer-plugin` - configured to fail if an active plugin is missing explicit version number (no `LATEST` allowed)

Some more validations can be pre-configured here as well, like `maven-checkstyle-plugin` or some other static analysis.

### What is NOT in it

* **dependencyManagement** because that would lead to frequent cascading releases whenever any managed dependency changes
* authoritative **pluginManagement** - only few plugins are here, conveniently configuring most important stuff like Unicode etc.
