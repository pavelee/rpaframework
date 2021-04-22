*** Settings ***
Library    RPA.Dialogs

*** Test Cases ***
All elements
    Add title           An default title
    Add title           A sized title    size=large

    Add text            Some default text
    Add text            Some sized text    size=small

    Add link            https://www.robocorp.com
    Add link            www.robocorp.com
    Add link            www.robocorp.com    label=Robocorp

    Add image           http://placekitten.com/g/200/300
    Add image           http://placekitten.com/g/800/800
    Add image           http://placekitten.com/g/800/800    width=200
    Add image           ${CURDIR}${/}resources${/}cat.jpeg
    Add file            ${CURDIR}${/}resources${/}file1.txt
    Add file            ${CURDIR}${/}resources${/}file1.txt    label=Textfile

    Add files           ${CURDIR}${/}resources${/}*.txt
    Add files           *.robot

    Add icon            Success
    Add icon            Warning
    Add icon            Failure

    Add text input      text-field-1
    Add text input      text-field-2    label=Text input    placeholder=Text goes here

    Add password input  password-field-1
    Add password input  password-field-2    label=Password input    placeholder=Password goes here

    Add hidden input    hidden-field     Some hidden value

    Add file input      file-field-1
    Add file input      file-field-2    label=File input   source=~/Downloads    destination=/tmp/not-exist
    Add file input      file-field-3    label=File input   source=/home/ossi/Downloads/    multiple=True    file_type=Log files (*.log;*.txt)

    Add drop-down       dropdown-field-1   ['one', 'two', 'three']
    Add drop-down       dropdown-field-2   ['one', 'two', 'three']    default=three
    Add drop-down       dropdown-field-3   []    label=Empty

    Add radio buttons   radio-field-1      ['one', 'two', 'three']
    Add radio buttons   radio-field-2      ['one', 'two', 'three']    default=three
    Add radio buttons   radio-field-3      []    label=Empty

    Add checkbox        checkbox-field-1   Checkbox label
    Add checkbox        checkbox-field-2   Checkbox label    default=True

    Add submit buttons  ['one', 'two']
    Add submit buttons  []

    # NOTE: Uncomment to test what this looks like, but don't spawn during test
    # &{result}=    Show dialog
    # Log many    &{result}

Multiple dialogs
    [Tags]   skip
    Add title    1/3
    Add hidden input    index  1
    ${one}=      Create dialog

    Add title    2/3
    Add hidden input    index  2
    ${two}=      Create dialog

    Add title    3/3
    Add hidden input    index  3
    ${three}=    Create dialog

    ${results}=  Wait all dialogs
    FOR    ${result}    IN     @{results}
        Log many    &{result}
    END
