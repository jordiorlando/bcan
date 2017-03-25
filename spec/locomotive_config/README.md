# Beacon Mappings Binary Format
This defines the format used to store beacon mappings.

## File Breakdown
Config Version (8 bits)

Number of Mappings (32 bits)

Beacon Mapping (32 bits)
- [31:16] Beacon ID
- [15:14] Direction of Travel
  - 01: forward
  - 10: reverse
  - 11: either
- [13:12] Train Direction
  - 01: forward
  - 10: reverse
  - 11: either
- [11:7] Instruction
  - 0-28: decoder functions
  - 29: speed
  - 30: direction
  - 31: custom
- [6:0] Data
  - Decoder Function (e.g. lamp)
    - 0-127: data (e.g. brightness)
  - Speed
    - 0: stop
    - 1: emergency stop
    - 2-127: speed
  - Direction
    - 0: reverse (train direction)
    - 1: forward (train direction)
    - 2: reverse (direction of travel)
    - 3: forward (direction of travel)
    - 4: switch direction
  - Custom
    - 0-127: custom function ID

## Explanation of Direction Bits
The following tables describe the meaning of the direction bits, as well as how they relate to each other.

<table>
  <caption>Bit meanings</caption>
  <thead>
    <tr>
      <th></th>
      <th>Train Direction (dir)</th>
      <th>Beacon Side (side)</th>
      <th>Direction of Travel (dot)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>01</th>
      <td>forward</td>
      <td>right</td>
      <td>forward</td>
    </tr>
    <tr>
      <th>10</th>
      <td>reverse</td>
      <td>left</td>
      <td>reverse</td>
    </tr>
  </tbody>
</table>

<table>
  <caption>Truth table</caption>
  <thead>
    <tr>
      <th>dir</th>
      <th>side</th>
      <th>dot</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>01</td>
      <td>01</td>
      <td>01</td>
    </tr>
    <tr>
      <td>01</td>
      <td>10</td>
      <td>10</td>
    </tr>
    <tr>
      <td>10</td>
      <td>01</td>
      <td>10</td>
    </tr>
    <tr>
      <td>10</td>
      <td>10</td>
      <td>01</td>
    </tr>
  </tbody>
</table>
