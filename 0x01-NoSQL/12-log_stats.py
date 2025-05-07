#!/usr/bin/env python3
'''Provides stats about Nginx logs stored in MongoDB'''

from pymongo import MongoClient


def print_nginx_request_logs(nginx_collection):
    '''Prints stats about Nginx request logs'''
    print('{} logs'.format(len(list(nginx_collection.find()))))
    print('Methods:')
    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    for method in methods:
        count = len(list(nginx_collection.find({'method': method})))
        print('\tmethod {}: {}'.format(method, count))
    status_check_count = len(list(
        nginx_collection.find({'method': 'GET', 'path': '/status'})
    ))
    print('{} status check'.format(status_check_count))


def main():
    '''Connects to MongoDB and prints the log stats'''
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx_collection = client.logs.nginx
    print_nginx_request_logs(nginx_collection)


if __name__ == '__main__':
    main()
