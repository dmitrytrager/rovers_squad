# rover_squad
Rover Squad app

Run `rspec specs` to perform testing.
To start program itself run `./rover_squad ./seeds/base.txt`.

## Notes
0. Squad model got several private method b/c of check I decided to do. This is
   the check for rovers start positions collision.
1. I did not add a good test for rover positions collision check (was out of time).
2. A little bit concerned about passing both position and label into plateau checks.
   The very first goal was to move labeling logic in one place.
3. I would refactor Squad model to reveal more public method and new classes if
   I had some more time.
