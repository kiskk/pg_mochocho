# contrib/pg_mochocho/Makefile
EXTENSION = pg_mochocho
DATA = pg_mochocho--1.0.sql
PGFILEDESC = "Handle the name of Japanese confectionery made by baking a dough consisting mainly of wheat flour with anko (sweet bean paste) in a metal baking mold"

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
