# Implemented changes

## API

1. Created `Role` model/table with `UserRole` intermediate association to handle user roles

  a. Allows users to have multiple roles

  b. Allows for managing custom roles

  c. Could also be expanded to manage "tenant" access, ie
  User 1 has full access to Project 1 but only view access to project 2

2. Added [pundit gem](https://github.com/varvet/pundit) to handle user permissions via policies that check for the user role and allow or forbid actions accordingly.

This could be combined with the tenant feature to validate which users have what type of access to what resources.

3. Fixed existing tests by adding full access role to account for user permissions

## UI

-

# Missing items

## API

1. More granular permission control to take advangate of the possibility of tenant access granted to specific users to specific resources.

2. More detailed testing to validate correct behavior to all roles available.

## UI

1. Implementation of actions to handle role assignment.
