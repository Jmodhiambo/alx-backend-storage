#!/usr/bin/env python3
"""Task 101's module.
"""


def top_students(mongo_collection):
    """Returns all students sorted by average score."""
    return list(mongo_collection.aggregate([
        {
            "$project": {
                "name": 1,
                "topics": 1,
                "averageScore": {
                    "$avg": "$topics.score"
                }
            }
        },
        {
            "$sort": {
                "averageScore": -1
            }
        }
    ]))
