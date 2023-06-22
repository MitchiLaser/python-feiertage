Quickstart
==========

Beginners examples
------------------

This package provides an easy to use library to generate all the German national holidays for each federal state. To specify a federal state the name of the state or a shorter state code can be used. The following list is a collection of all the supported parameter options:

::
  
  - 'Deutschland' / 'DE',
  - 'Baden-Württemberg' / 'BW',
  - 'Bayern' / 'BY',
  - 'Berlin' / 'BE',
  - 'Brandenburg' / 'BB',
  - 'Bremen' / 'HB',
  - 'Hamburg' / 'HH',
  - 'Hessen' / 'HE',
  - 'Mecklenburg-Vorpommern' / 'MV',
  - 'Niedersachsen' / 'NI',
  - 'Nordrhein-Westfalen' / 'NW',
  - 'Rheinland-Pfalz' / 'RP',
  - 'Saarland' / 'SL',
  - 'Sachsen' / 'SN',
  - 'Sachsen-Anhalt' / 'ST',
  - 'Schleswig-Holstein' / 'SH',
  - 'Thüringen' / 'TH',

.. note:: If the state Code `'Deutschland' / 'DE'` is used then only the holidays which all states have in common are calculated

Furthermore there are  optional parameters:

* `year`: this parameter specifies the year in which all the holidays should be calculated. The default is the current year from the system clock
* `school_free`: if this parameter is manually set to `True` then also days which are no holidays but there is no school will also be generated
* `regional`: if this parameter is manually set to `True` then the days which are n holidays in the whole state but only in some communities will also be generated

With this knowledge there is no more to say.

::
  
  >>> import feiertage
  >>> from pprint import pprint
  >>> # Holidays for Baden-Württemberg current year (2023)
  >>> pprint(feiertage.Holidays("BW").holidays)
  [{'date': datetime.date(2023, 1, 1), 'name': 'Neujahr'},
   {'date': datetime.date(2023, 5, 1), 'name': 'Tag der Arbeit'},
   {'date': datetime.date(2023, 10, 3), 'name': 'Tag der deutschen Einheit'},
   {'date': datetime.date(2023, 12, 25), 'name': '1. Weihnachstag'},
   {'date': datetime.date(2023, 12, 26), 'name': '2. Weihnachstag'},
   {'date': datetime.date(2023, 4, 7), 'name': 'Karfreitag'},
   {'date': datetime.date(2023, 4, 10), 'name': 'Ostermontag'},
   {'date': datetime.date(2023, 5, 18), 'name': 'Christi-Himmelfahrt'},
   {'date': datetime.date(2023, 5, 29), 'name': 'Pfingstmontag'},
   {'date': datetime.date(2023, 1, 6), 'name': 'Heilige drei Könige'},
   {'date': datetime.date(2023, 6, 8), 'name': 'Fronleichnam'},
   {'date': datetime.date(2023, 11, 1), 'name': 'Allerheiligen'}]

This example shows how to use the basic functionality. The dates for the holidays are stored in individual `datetime.date <https://python.readthedocs.io/en/latest/library/datetime.html>`_ objects.

If the names of the holidays are not required then the `get_holidays_list()` function returns only a list of all the datetime objects without any meta information:

::

  >>> import feiertage
  >>> from pprint import pprint
  >>> # holidays for the Saarland in the year 2007
  >>> pprint(feiertage.Holidays("SL", year=2007).get_holidays_list())
  [datetime.date(2007, 1, 1),
   datetime.date(2007, 5, 1),
   datetime.date(2007, 10, 3),
   datetime.date(2007, 12, 25),
   datetime.date(2007, 12, 26),
   datetime.date(2007, 4, 6),
   datetime.date(2007, 4, 9),
   datetime.date(2007, 5, 17),
   datetime.date(2007, 5, 28),
   datetime.date(2007, 6, 7),
   datetime.date(2007, 8, 15),
   datetime.date(2007, 11, 1)]

Another example showing how the `school_free` parameter can be used to determine only the school free days:

::

  >>> import feiertage
  >>> # Find the school free days in Bavaria
  >>> list(set(feiertage.Holidays("BY").get_holidays_list()) ^ set(feiertage.Holidays("BY", school_free=True).get_holidays_list()))
  [datetime.date(2023, 11, 22)]

Easter Calculation
------------------

The :ref:`feiertage.easter module` provides a simple way to calculate easter for a given year:

::

  >>> from feiertage import easter
  >>> easter.calc_easter(2000)
  datetime.date(2000, 4, 23)
