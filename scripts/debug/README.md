# Debug
This folder contains scripts with bugs or scripts that are in the early stages of development.
It is important to note that these scripts are provided for debugging purposes only and should not be used in a production environment. Please treat them as read-only files.

## Error Handling Variables
| Variable                       | Description                                                     |
| ------------------------------ | --------------------------------------------------------------- |
| `$ErrorActionPreference`       | Determines action on error occurrence                           |
| `$PSCulture` or `$PSUICulture` | Represents the culture (language) used in the session (i18n)    |
| `$ErrorView`                   | Controls the display of error records                           |
| `$Error`                       | Contains an array of error objects generated during the session |
| `$ErrorAction`                 | Specifies the action to take for a specific error               |
| `$ErrorVariable`               | Stores error information in a specified variable                |

## Environment Information
| Variable             | Description                                                       |
| -------------------- | ----------------------------------------------------------------- |
| `$PSEdition`         | Indicates the edition of PowerShell (e.g., `"Desktop"`, `"Core"`) |
| `$PSModulePath`      | Represents the search path for PowerShell modules                 |
| `$PSRemotingContext` | Contains information about the current remoting session           |
| `$PROFILE`           | Points to the current user's PowerShell profile script            |
| `$PSVersionTable`    | Contains information about the current PowerShell version         |
| `$ExecutionContext`  | Provides information about the current execution context          |
| `$PID`               | Represents the process ID of the current session                  |
| `$HOME`              | Represents the user's home directory                              |
| `$PSHome`            | Indicates the installation directory of PowerShell                |
| `$USERPROFILE`       | Represents the user's profile directory                           |

## Script Invocation
| Variable               | Description                                                             |
| ---------------------- | ----------------------------------------------------------------------- |
| `$MyInvocation`        | Contains details about the current script or script block invocation    |
| `$PSScriptRoot`        | Represents the root directory of the current script                     |
| `$PSCommandPath`       | Indicates the full path to the script or module being executed          |
| `$PSCommandInvocation` | Contains information about the current script or command being executed |
| `$PSCommandParameter`  | Represents the parameters passed to the current script or command       |

## Pipeline Information
| Variable                  | Description                                          |
| ------------------------- | ---------------------------------------------------- |
| `$Input`                  | Represents the input received from the pipeline      |
| `$_`                      | Contains the current pipeline object                 |
| `$PSCmdlet`               | Represents the current cmdlet in the pipeline        |
| `$OFS`                    | Specifies the separator used to format output        |
| `$FormatEnumerationLimit` | Sets the limit for enumerating items in the pipeline |

## Host Information
| Variable               | Description                                       |
| ---------------------- | ------------------------------------------------- |
| `$Host`                | Represents the hosting application or environment |
| `$Host.Name`           | Specifies the name of the hosting application     |
| `$Host.Version`        | Indicates the version of the hosting application  |
| `$Host.UI`             | Provides access to the user interface of the host |
| `$Host.CurrentCulture` | Represents the current culture used by the host   |

## Verbose Output
| Variable             | Description                                   |
| -------------------- | --------------------------------------------- |
| `$VerbosePreference` | Controls the display of verbose messages      |
| `$Verbose`           | Contains an array of verbose messages         |
| `$VerboseVariable`   | Stores verbose output in a specified variable |

## Debugging
| Variable           | Description                                 |
| ------------------ | ------------------------------------------- |
| `$DebugPreference` | Determines how debug messages are handled   |
| `$Debug`           | Contains an array of debug messages         |
| `$DebugVariable`   | Stores debug output in a specified variable |

## Warning Handling 
| Variable             | Description                                         |
| -------------------- | --------------------------------------------------- |
| `$WarningPreference` | Determines action on warning occurrence             |
| `$WarningAction`     | Specifies the action to take for a specific warning |
| `$WarningVariable`   | Stores warning messages in a specified variable     |

## Informational Messages
| Variable                 | Description                                               |
| ------------------------ | --------------------------------------------------------- |
| `$InformationPreference` | Determines action on informational messages               |
| `$InformationAction`     | Specifies the action to take for an informational message |
| `$InformationVariable`   | Stores informational messages in a specified variable     |