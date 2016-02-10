#!/bin/bash

OURDEV="\"\"\"Development settings and globals.\"\"\"


from os.path import join, normpath

from settings_base import *


########## DEBUG CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#debug
DEBUG = True

# See: https://docs.djangoproject.com/en/dev/ref/settings/#template-debug
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG
THUMBNAIL_DEBUG = DEBUG
########## END DEBUG CONFIGURATION


########## EMAIL CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#email-backend
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
########## END EMAIL CONFIGURATION


########## DATABASE CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#databases
DATABASES = {
     'default': {
         'ENGINE': 'django.db.backends.postgresql_psycopg2',
         'NAME': 'ni_multisim5',    # Or path to database file if using sqlite3.
         'USER': '',             # Not used with sqlite3.
         'PASSWORD': '',     # Not used with sqlite3.
         'HOST': '',   # Set to empty string for localhost. Not used with sqlite3.
         'PORT': '',                 # Set to empty string for default. Not used with sqlite3.
     }
}
########## END DATABASE CONFIGURATION
LOCKDOWN_ENABLED = False

########## CACHE CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#caches
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}
########## END CACHE CONFIGURATION




########## TOOLBAR CONFIGURATION
# See: https://github.com/django-debug-toolbar/django-debug-toolbar#installation
INSTALLED_APPS += (
    'debug_toolbar',
)

# See: https://github.com/django-debug-toolbar/django-debug-toolbar#installation
INTERNAL_IPS = ('127.0.0.1',)

# See: https://github.com/django-debug-toolbar/django-debug-toolbar#installation
MIDDLEWARE_CLASSES += (
    'debug_toolbar.middleware.DebugToolbarMiddleware',
)

########## END TOOLBAR CONFIGURATION

######## FILE STORAGE API CREDENTIALS
AWS_FILESTORAGE_ACCESS_KEY = \"AKIAJNBPOXZSVT5GLHNA\"
AWS_FILESTORAGE_SECRET_KEY = \"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\"
AWS_FILESTORAGE_BUCKET = \"multisim-filestorage-api\"
######## END FILE STORAGE API CREDENTIALS


try:
    from local_dev import *
except ImportError:
    pass
"

if [ ! -f ~/sharktank/website/ni_multisim/ni_multisim/settings/dev.py.bak ]; then
  echo "===backup original dev.py==="
  #modify the dev config file for local use, replace by our version
  mv ~/sharktank/website/ni_multisim/ni_multisim/settings/dev.py ~/sharktank/website/ni_multisim/ni_multisim/settings/dev.py.bak
fi

if [ ! -f ~/sharktank/website/ni_multisim/ni_multisim/settings/dev.py ]; then
  echo "===modify the dev.py file in website/ni_multisim/ni_multisim/settings to work for a local install==="
  echo "${OURDEV}" > ~/sharktank/website/ni_multisim/ni_multisim/settings/dev.py
fi

