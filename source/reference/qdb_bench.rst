quasardb benchmarking tool
******************************

.. highlight:: js
.. program:: qdb_comparison

Introduction
============

The quasardb benchmarking tool (`qdb_bench`) enables you to evaluate the performance of your quasardb cluster. To do so, it runs a script on the specified cluster and measures the time taken to process the commands as accurately as the operating systems allows it.


Quick Reference
===============

 ===================================== ============================ ============================
                Option                             Usage                Default
 ===================================== ============================ ============================
 :option:`-h`, :option:`--help`        display help
 :option:`--cluster`                    address:port of node         127.0.0.1:2836
 :option:`--protocol`                  test protocol to use          quasardb
 :option:`--threads`                   number of threads to use      1
 :option:`-f`, :option:`--test-file`   test script to run            test.cfg
 :option:`-o`, :option:`--output-file` path for CSV output           report_<date>-<time>.csv
 ===================================== ============================ ============================


Usage scenarii
===============

 * Identifiying hardware limits in a quasardb cluster (network bandwidth, server processing power, etc.)
 * Determining the maximum throughput of your cluster
 * Tuning

Supported protocols
======================

The tool can be used to benchmark on servers supporting the following protocols (in alphabetical order):

 * local
 * memcached
 * quasardb
 * redis

The local protocol creates a virtual "local" server to test the local machine memory bandwidth. This can help identify memory-related bottlenecks or abnormal allocator behavior.

Benchmark script
====================

Each benchmark is a script that runs operations in the given order.

For example to put one-kilobyte (1024-byte) entry once and retrieve it ten (10) times, the script is::

    tests
    {
        single_put_multiple_get
        {
            count 10
            size 1024
        }
    }

If you want to add another test, for example, if you want to put one-byte (1) entry and retrieve it thousand (1,000) times, the script becomes::

    tests
    {
        single_put_multiple_get
        {
            count 10
            size 1024
        }

        single_put_multiple_get
        {
            count 1000
            size 1
        }
    }

Script Commands
===============

Each command requires the count and size parameters.

The accepted commands are:

    * ``single_put_multiple_get``: adds one entry of *size* bytes and retrives it *count* times
    * ``single_put_multiple_update``: adds one entry of *size* bytes and updates it *count* times
    * ``multiple_put``: puts *count* entries of *size* bytes and then deletes them all
    * ``multiple_put_remain``: puts *count* entries of *size* bytes, but does not delete them
    * ``multiple_put_get_delete``: adds an entry of *size* bytes, retrieves it and deletes it *count* times
    * ``multiple_put_get_update_delete``: adds an entry of *size* bytes, retrieves it, updates it and deletes it *count* times

Parameters reference
====================

.. option:: -h, --help

    Displays basic usage information.

    Example
        To display the online help, type: ::

            qdb_bench --help

.. option:: --cluster=<address>:<port>

   Specifies the address and port of the quasardb daemon to which the benchmark tool must connect. The daemon must conform to the protocol specified by the :option:`--protocol` parameter.

   Argument
        The address and port of a machine where a daemon is running.

   Default value
        127.0.0.0:2836, the IPv4 localhost address and the port 2836

   Example
        If the daemon listens on localhost and on the port 5009::

            qdb_httpd --cluster=localhost:5009

.. option:: --protocol=<protocol>

    Specifies the protocol to use.

    Argument
        A string representing the name of the protocol to use. Supported values are ``local``, ``memcached``, ``quasardb`` and ``redis``.

    Default value
        quasardb

    Example
        Run the test on a memcached compatible server::

            qdb_bench --protocol=memcached

.. option:: --threads=<threads>

    Specifies the number of threads `qdb_bench` should use to run the test. Each thread will run the test script, duplicating its operations. This function is helpful to simulate multiple clients from a single test instance.

    Argument
        An integer between 1 and 100 representing the number of threads to use.

    Default value
        1

    Example
        Run the test two times in two separate threads::

            qdb_bench --threads=2

.. option:: -f <path>, --test-file=<path>

    The test script to run.

    Argument
        A string representing the full path to the test script.

    Default value
        test.cfg

    Example
        Runs the tests written in ``stress.cfg``::

            qdb_bench --test-file=stress.cfg

.. option:: -o <path>, --output-file=<path>

    Specifies the path for the `CSV <https://en.wikipedia.org/wiki/Comma-separated_values>`_ output.

    Argument
        A string representing the full path to the results file:

    Default value
        A file name prefixed *report_* and suffixed with the current date and time.

    Example
        Output the results to ``results.csv``::

            qdb_bench --output-file=results.csv

