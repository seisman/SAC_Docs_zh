错误与警告
##########

.. only show chapter in tableofcontents
.. not numerbing sections
.. raw:: latex

   \addtocontents{toc}{\setcounter{tocdepth}{0}}
   \titleformat{\section}{\Large\bfseries}{}{0em}{}{}

.. toctree::
   :maxdepth: 1

   msg0.rst
   msg1.rst
   msg2.rst
   msg5.rst
   msg9.rst
   msgn.rst

.. revert to original settings
.. raw:: latex

   \addtocontents{toc}{\setcounter{tocdepth}{1}}
   \titleformat{\section}{\Large\bfseries}{\thesection}{0.5em}{}{}
