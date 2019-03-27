from distutils.core import Extension
from distutils.core import setup

setup(
    name='doubler',
    version='0.0.1',
    ext_modules=[
        Extension(
            'doubler',
            sources = ['src/c/python_extension.c']
        ),
    ],
)
