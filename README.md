# Cyber Attacks and Defense

This repository serves as a comprehensive archive of educational content,
meticulously curated to facilitate the progressive journey of
aspiring cybersecurity enthusiasts into the realm of
contemporary cyber-attacks.

It encompasses an array of resources, including but not limited to:

1. Presentation slides offering theoretical knowledge and strategic insights.
2. Direct links to instructional videos for auditory and visual learning.
3. Practical instances, demonstrated through codes and binaries, to provide a hands-on experience.
4. Detailed solutions and explanations to reinforce understanding and self-assessment.

These materials are strategically structured around multiple `pwnable` examples,
each serving as a learning module, to ensure a seamless transition from
theoretical aspects to real-world hacking scenarios.
This approach aims to empower novice hackers with the acumen and
proficiency required to navigate, understand, and innovate in
the ever-evolving landscape of cybersecurity threats and defenses.

# Running binary files

The binary files here are tested running on the following Linux distributions:

1. Ubuntu 16.04 LTS
2. Ubuntu 18.04 LTS (Bionic Beaver; go BEAVS, go OSUSEC!)
3. Ubuntu 20.04 LTS
4. Ubuntu 22.04 LTS

# Creating a docker image

You can either run `build.sh` and `run.sh` to build and run the docker image,
or install Podman to create and run the image.

## Docker
```
$ ./build.sh    # this will build the image as cand:latest
$ ./run.sh      # this will run the image cand:latest
                # please note that run.sh will remove the container
                # right after you exit from it (ran with --rm)
```

## Podman
```bash
$ podman build -t cand https://github.com/blue9057/cyber-attacks-and-defense
$ podman run -t -a stdin -a stdout -a stderr cand
```

The process will take a while to build dependencies in the container.
You may want to get yourself properly in the hacking mood.


## Enabling/Disabling ASLR

To disable ASLR on the container, you must run the following comamnds
on your **host** system.

For Linux systems: `sudo echo 0 | sudo tee /proc/sys/kernel/randomize_va_space`

ASLR options:
* `0`: Disable
* `1`: Shared libraries, stack, mmap(), VDSO and heap
* `2`: Full ASLR

## Manage your Container

Find container ID: `podman ps -a`

Stop container (saving progress): `podman stop containerid`

Get TTY back after stopping: `podman start -a containerid`

Please note: I did not test all of the challenges, so please report any issues.

Also please note: This is meant to be a container for single user use. It's not meant for a classroom. I don't intend on making a multi-user version.

## For the one who wants to take the quicker path to the flag
The solutions can be found in `/root`. To get root, you need to do `su - admin` using the very secure `password`, then you may run `sudo`.


# License
This repository operates under dual licensing terms, delineated as follows:

1. Student Associations:
Entities recognized as student clubs --- defined herein as organizations
presided over by a board of directors composed entirely of students ---
are authorized to utilize all materials contained within this repository,
subject to the terms stipulated by
the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
(CC BY-NC-ND 4.0) License.

2. Non-Student Entities:
All other organizations, inclusive of non-profit establishments such as
universities, research centers, institutions, and national laboratories,
are likewise bound by the conditions of the CC BY-NC-ND 4.0 License,
with the enforcement of an additional mandatory provision:

## Mandatory Donation Clause

For every individual member accessing the repository's materials under
the auspices of the organization, a compulsory donation of $100 (USD)
per person is required. This donation is to be directed to
the nearest student-run security club
(qualified by a governance structure consisting solely of students)
as an unrestricted gift, imposed without subsequent conditions or encumbrances.

To exemplify, should Oregon State University elect to
incorporate materials from this repository for instructional purposes within
a class of 100 attendees, a donation amounting to $10,000 (USD) is mandated,
payable to the proximate student-operated security association,
identified in this instance as OSUSEC.

This arrangement seeks to foster a supportive ecosystem for
burgeoning cybersecurity education programs while ensuring adherence to
fair usage and the promotion of educational initiatives.

For an exhaustive understanding and legal interpretation of the licensing terms,
concerned parties are directed to consult the full text,
available in the LICENSE.md file accompanying this repository.

Parties are advised to review these terms thoroughly
to ascertain compliance with all stipulated conditions and restrictions,
thereby preempting any inadvertent contravention of the licensing agreement.


## Exception to the Mandatory Donation Clause

An exemption to the stipulated mandatory donation requirement
may be granted under the specific authorization of the repository's
principal contributor, Dr. Yeongjin Jang. Parties interested in seeking
concessions concerning this clause, such as a reduction in the prescribed
donation amount, are advised to initiate a formal request by reaching out to
Dr. Jang directly through electronic correspondence at
dr.yeongjin.jang@gmail.com.

Such communications will be subject to his discretion,
and any adjustments to the licensing terms will be considered on
a case-by-case basis.

