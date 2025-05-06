#!/usr/bin/env python3
"""Inserts a new document in a collection based on kwargs"""


def insert_school(mongo_collection, **kwargs):
    """Inserts a new document and returns the new _id"""
    return mongo_collection.insert(kwargs)
