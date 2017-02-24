# Beacon Mappings Format
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
  - 30:
  - 31: custom
- [6:0] Data
  - Light (0-127 brightness)
  - Speed (0 stop, 1 emergency stop, 2-127 speed)

## Bit Descriptions
- Train Direction (dir):
  - 01: forward
  - 10: reverse
- Beacon Side (side):
  - 01: right
  - 10: left
- Direction of Travel (dot):
  - 01: forward
  - 10: reverse

### Truth Table
   dir|side|dot  
   01 | 01 | 01  
   01 | 10 | 10  
   10 | 01 | 10  
   10 | 10 | 01  
