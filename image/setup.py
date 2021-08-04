import glob
from setuptools import setup, find_packages


DRAKE_VERSION = '0.32.0'

# build_wheel/
#   - setup.py
#   - pydrake/
#      - .drake-find_resource-sentinel
#      - doc/
#      - examples/
#      - lib/
#      - manipulation/


pydrake_lib = ['../' + f for f in glob.iglob("pydrake" + '**/**', recursive=True) if '.so' in f]

docs = ['../' + f for f in glob.iglob("pydrake/doc" + '**/**', recursive=True)]
examples = ['../' + f for f in glob.iglob("pydrake/examples" + '**/**', recursive=True)]
lib = ['../' + f for f in glob.iglob("pydrake/lib" + '**/**', recursive=True)]
manipulation = ['../' + f for f in glob.iglob("pydrake/manipulation" + '**/**', recursive=True)]


# Required python packages that will be pip installed along with pydrake
python_required = [
  "matplotlib",
  "meshcat",
  "numpy",
  "pydot",
  "pygame",
  "PyYAML",
  "scipy"
]

setup(name='pydrake',
      version=DRAKE_VERSION,
      description='Model-based design and verification for robotics',
      long_description ='''Drake ("dragon" in Middle English) is a toolbox maintained by the Robot
Locomotion Group at the MIT Computer Science and Artificial Intelligence
Lab (CSAIL). It is a collection of tools for analyzing the dynamics of
robots and building control systems for them in C++ and Python, with a
heavy emphasis on optimization-based design/analysis.''',
      url='https://drake.mit.edu',
      author='Drake Development Team',
      author_email='drake-users@mit.edu',
      packages=find_packages(),
      # Add in any packaged data.
      include_package_data=True,
      package_data={
        'pydrake': ['../.drake-find_resource-sentinel'] + docs + examples +
                   lib + manipulation + pydrake_lib
      },
      install_requires=python_required
      )
