#!/usr/bin/env python3
"""Returns list of schools having a specific topic"""


def schools_by_topic(mongo_collection, topic):
    """Returns a list of schools where 'topic' is in the 'topics' field"""
    return mongo_collection.find({"topics": topic})
