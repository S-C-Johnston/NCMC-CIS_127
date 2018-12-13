System hardening and auditing
=============================

Microsoft provides a handful of mechanisms to address auditing and system
hardening needs in Windows in their own particular philosophy. Some of
these are of their own doing, and some are inherited from industry
standards set decades ago. Among these are:

1. Access controls and permissions for their filesystem. Sequestering
   users and groups and controlling who can access files can help keep
both accidental and intentional unauthorized access from occurring.

2. Encryption in both a granular sense and for full-disk security. This
   helps to keep sensitive data safe when it is at rest. That is to say,
when not in use. I know from first hand experience how trivial it is to
break permissions if I can physically access a machine, since I've had
to do so to repair machines when the user forgets their credentials.
Sensitive information should only be stored locally on machines if that
information is encrypted at rest.

2. regedit -- The registry editing tools allow for administrators to
   audit the registry themselves and fix issues they encounter.

3. gpedit -- The group policy editing tools help to make managing large
   numbers of computers comparatively easy. This also allows
administrators to set logging and auditing policies on an entire domain
at once.

4. Others outside the scope of this document which help to flesh out the
   toolset.

Antivirus updates and scans
---------------------------

Logging and auditing logon events
---------------------------------

Potentially problematic events
------------------------------

What to do about these events
-----------------------------

Hardening and auditing and towards Fullsoft's goals
===================================================

Worrying trends and how they affect Fullsoft
--------------------------------------------

How this independent research helps Fullsoft
============================================
