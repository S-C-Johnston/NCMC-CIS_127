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

4. Event viewer -- What it says on the tin: allows for detailed auditing
   of the binary log data reported from multiple sources within the
system. Once auditing policy is set, this is where logon events can be
checked.

5. Others outside the scope of this document which help to flesh out the
   toolset.

Antivirus updates and scans
---------------------------

AVG is a trusted antivirus company which provides several conveniences
for administrators. Among those is a management console, a tool which
requires that machines be on the same domain as the AVG administration
server. This allows, among other things:

- On-demand and scheduled scans of arbitrarily large groups of machines.

- A centralized destination for warnings about threats found during
  scans, with the option to respond as appropriate.

- A centralized update and upgrade distribution cycle. Instead of every
  machine reaching out to AVG for updates or upgrades, the
administration server does this as needed, and machines on the domain
can be served virus definition updates and software upgrades remotely.

These things can be done manually on each machine, and for the sake of
argument I'll explain how, but it is tedious. To check for updates in
AVG, one would open the AVG application, locate the help/about section,
and check for virus definition or software updates. It will not
automatically upgrade the software without asking, because this often
requires a computer restart.

Scans can be initiated manually by pressing the big green Scan button,
or they can be scheduled. This can be done in the GUI using Scan Options
-> Manage Scheduled Scans. They can be set for a regular basis and
enabled.

Logs, as far as I can tell, are not exported to be viewed by Windows
Event Viewer unless through the use of AVG CloudCare. Otherwise, their
logs are locally stored in several possible
[locations](https://support.avg.com/SupportArticleView?l=en&urlname=Log-File-Locations-for-AVG-Products).
It is not uncommon (though mildly annoying) for antivirus vendors to
require the use of their own tools to view logs.

Logging and auditing logon events
---------------------------------

gpedit, mentioned earlier, comes into play here. This makes it possible
to log on both the domain controller and the workstation both successful
and failed logon events. In gpedit, the details can be found in Computer
Configuration -> Windows Settings -> Security Settings -> Local Policies
-> Audit Policy.

There are two kinds: "Account Logon" events and "Logon"
events. Microsoft's naming scheme is unfortunate, and it's easy to
confuse the two. There isn't a significant reason not to use both. In
short, the difference is:

| Account Logon Events | Logon Events |
|----------------------+--------------|
| Logons for which a   | Logon/off    |
| machine is the       | events on    |
| authority. DCs are   | any given    |
| the authority for    | machine.     |
| domain accounts.     |              |

How these are viewed, ultimately, is in the event viewer. I have a
tendency to type faster than I think on occasion, so it is not unusual
for me to have two failed logons before a proper success. Using both
Account Logon and Logon events, a success will likely show as two
successes, which is fine. These events can be found under Windows Logs
-> Security.

To filter for only this kind of event, we can handle it in a couple of
ways. Using "Filter Current Log" or "Create Custom View" on the right
side, we can filter by event ID number code using the
[list](https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/basic-audit-logon-events)
of [event
codes](https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/basic-audit-account-logon-events)
that Microsoft publishes. To filter by kind, Logon, rather than the
granular numbered ranges, we need to choose Event Source -> "Microsoft
Windows security auditing", and _then_ choose Task Category -> Logon, or
any other task categories desired.

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
