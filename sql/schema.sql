create table module (
 id integer not null auto_increment,
 module_name varchar(255) not null,
 module_version varchar(64) not null,
 module_version_numeric float(4,6),
 author_id integer not null,
 module_derived_from integer default 0,
 module_is_third_party tinyint(1) default 0,
 module_is_core float(1,2) default 0.0,
 module_is_bundle tinyint(1) default 0,
 module_requires_perl_version float(1,2) default 0.0,
 module_updated datetime,
 primary key (id)
);

create table author (
 id integer not null auto_increment,
 author_name varchar(255) not null,
 author_pauseid varchar(64),
 author_email varchar(255),
 author_website varchar(255),
 primary key (id)
)

create table tag (
 id integer not null auto_increment,
 tag_name varchar(128) not null,
 tag_comment text,
 created datetime,
 primary key (id)
)

create table tagged_modules (
  module_id integer not null,
  tag_id not null,
  created datetime,
  updated datetime
  primary key (module_id, tag_id),
)

create table cpan_latest_module_versions (
   module_name varchar(255),
   latest_cpan_version float(1,2),
   updated datetime,
   primary key (module_name, latest_cpan_version)
)

create table cpan_module_watchlist (
   module_name varchar(255) not null primary key,
   watch_bugs tinyint(1) default 0,
   watch_releases tinyint(1) default 0,
   fetch_new_releases tinyint(1) default 0,
);

create table local_modifications (
   id integer not null auto_increment,
   module_id integer not null,
   filename varchar(255),
   modification_type varchar(20),
   modification_description text,
   modification_date datetime,
   modification_author varchar(128),
   primary key (module_id, filename)
)

create 
