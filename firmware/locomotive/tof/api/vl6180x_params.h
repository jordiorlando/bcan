#ifndef VL6180x_PARAMS_Habc
#define VL6180x_PARAMS_Habc

 /**
  * @brief For user convenience to place or give any required data attribute
  * to the built-in single device instance \n
  * Useful only when Configuration @a #VL6180x_SINGLE_DEVICE_DRIVER is active
  *
  * @ingroup api_platform
  */
#define VL6180x_DEV_DATA_ATTR

/**
 * @def ROMABLE_DATA
 * @brief API Read only data that can be place in rom/flash are declared with that extra keyword
 *
 * For user convenience, use compiler specific attribute or keyword to place all read-only data in required data area. \n
 * For example using gcc section  :
 *  @code
 *  #define ROMABLE_DATA  __attribute__ ((section ("user_rom")))
 *  // you may need to edit your link script file to place user_rom section in flash/rom memory
 *  @endcode
 *
 * @ingroup api_platform
 */
#define ROMABLE_DATA
/*  #define ROMABLE_DATA  __attribute__ ((section ("user_rom"))) */

/**
 * @def VL6180x_RANGE_STATUS_ERRSTRING
 * @brief  Activate error code translation into string.
 * TODO: michel to apdate
 * @ingroup api_platform
 */
#define VL6180x_RANGE_STATUS_ERRSTRING 1

/**
 * @def VL6180x_SINGLE_DEVICE_DRIVER
 * @brief Enable lightweight single vl6180x device driver.
 *
 * Value __1__ =>  Single device capable.
 * Configure optimized API for single device driver with static data and minimal use of ref pointer. \n
 * 				Limited to single device driver or application in non multi thread/core environment. \n
 *
 * Value __0__ =>  Multiple device capable. User must review "device" structure and type in vl6180x_platform.h files.
 * @ingroup api_platform
 */
#define VL6180x_SINGLE_DEVICE_DRIVER 1

/**
 * @def VL6180X_SAFE_POLLING_ENTER
 * @brief Ensure safe polling method when set
 *
 * Polling for a condition can be hazardous and result in infinite looping if any previous interrupt status
 * condition is not cleared. \n
 * Setting these flags enforce error clearing on start of polling method to avoid it.
 * the drawback are : \n
 * @li extra use-less i2c bus usage and traffic
 * @li potentially slower measure rate.
 * If application ensures interrupt get cleared on mode or interrupt configuration change
 * then keep option disabled. \n
 * To be safe set these option to 1
 * @ingroup api_platform
 */
#define VL6180X_SAFE_POLLING_ENTER  0

/**
 * @brief Enable start/end logging facilities. It can generates traces log to help problem tracking analysis and solving 
 *
 * Requires porting  @a #LOG_FUNCTION_START, @a #LOG_FUNCTION_END, @a #LOG_FUNCTION_END_FMT
 * @ingroup api_platform
 */
#define VL6180X_LOG_ENABLE  0

#endif