*** Settings ***
Resource            ../keywords/common.robot
Library             DateTime

Test Setup              Setup
Test Teardown           Tear Down
 

*** Test Cases ***
## Link to Test Cases  https://docs.google.com/spreadsheets/d/1BcOkWzu3LqH4ZF731aBCCrDFJId8G0j63ROUn4X1kk4/edit#gid=1964081478 ###
##Check the User Interface of the Category page
CT_01 Verify that navigating to the right "Danh mục" page
    [Tags]                                                                                        MainPage                                     UI                                          Smoketest
    Login to admin
    When Click "QUẢN LÝ DANH MỤC" menu
    When Click "Danh mục" sub menu to "/code-types"
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database

CT_02 Verify the function changing the number of data show in each list
    [Tags]                                                                                        MainPage                                     UI                                          Smoketest
    Go to "Danh mục" page
    When Click on "second" selection to change the number of account show in list and check
    When Click on "third" selection to change the number of account show in list and check
    When Click on "fourth" selection to change the number of account show in list and check
    When Click on "fifth" selection to change the number of account show in list and check
    When Click on "fourth" selection to change the number of account show in list and check

CT_03 Verify that highlight after clicking on it
    [Tags]                                                                                        MainPage                                     UI                                          Smoketest
    Go to "Danh mục" page
    When Select on the "Nhóm thủ thuật" item line
    Then "Nhóm thủ thuật" item line should be highlighted
    When Select on the "Độ khó" item line
    Then "Độ khó" item line should be highlighted
    When Select on the "Bằng cấp chuyên môn" item line
    Then "Bằng cấp chuyên môn" item line should be highlighted
    When Select on the "Số răng" item line
    Then "Số răng" item line should be highlighted

CT_04_01 Verify the function navigating to other lists of data page
    [Tags]                                                                                        MainPage                                     UI                                          Smoketest
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    Then Check the amount of page list
    ${Last_name}=    Get the last account name
    Create a test data with "Nhóm thủ thuật" type
    When Move to the "next" page
    ${First_name}=    Get the first account name
    Then Should Be Equal    ${First_name}    ${Last_name}
    When Move to the "previous" page
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Move to the last page and check

CT_04_02 Verify the function navigating to other lists of data page
    [Tags]    mainpage    ui    smoketest
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    Then Check the amount of page list
    ${Last_name}=    Get the last account name
    Create a test data with "Độ khó" type
    When Move to the "next" page
    ${First_name}=    Get the first account name
    Then Should Be Equal    ${First_name}    ${Last_name}
    When Move to the "previous" page
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Move to the last page and check
CT_04_03 Verify the function navigating to other lists of data page
    [Tags]    mainpage    ui    smoketest
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    Then Check the amount of page list
    ${Last_name}=    Get the last account name
    Create a test data with "Bằng cấp chuyên môn" type
    When Move to the "next" page
    ${First_name}=    Get the first account name
    Then Should Be Equal    ${First_name}    ${Last_name}
    When Move to the "previous" page
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Move to the last page and check
CT_04_04 Verify the function navigating to other lists of data page
    [Tags]    mainpage    ui    smoketest
    Go to "Danh mục" page
    Select on the "Số răng" item line
    Then Check the amount of page list
    ${Last_name}=    Get the last account name
    Create a test data with "Số răng" type
    When Move to the "next" page
    ${First_name}=    Get the first account name
    Then Should Be Equal    ${First_name}    ${Last_name}
    When Move to the "previous" page
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Move to the last page and check
## Verify the creating data function
CT_05 Verify "Thêm mới Nhóm thủ thuật" button function
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    Then Heading should contains "Thêm mới Nhóm thủ thuật" inner Text
    Then Confirm adding "/code-types/MEDICAL_PROCEDURE_GROUP" page
    Then Webpage should contain "Tiêu đề" input field
    Then Webpage should contain "Thứ tự" input field
    Then Webpage should contain "Mã" input field
    Then Webpage should contain "Mô tả" input field

CT_06 Verify "Thêm mới Độ khó" button function
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    Then Heading should contains "Thêm mới Độ khó" inner Text
    Then Confirm adding "/code-types/MEDICAL_PROCEDURE_DIFFICULTY" page
    Then Webpage should contain "Tiêu đề" input field
    Then Webpage should contain "Thứ tự" input field
    Then Webpage should contain "Mã" input field
    Then Webpage should contain "Mô tả" input field

CT_07 Verify "Thêm mới Bằng cấp chuyên môn" button function
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    Then Heading should contains "Thêm mới Bằng cấp chuyên môn" inner Text
    Then Confirm adding "/code-types/MEDICAL_DEGREE" page
    Then Webpage should contain "Tiêu đề" input field
    Then Webpage should contain "Thứ tự" input field
    Then Webpage should contain "Mã" input field
    Then Webpage should contain "Mô tả" input field

CT_08 Verify "Thêm mới Số răng" button function
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    Then Heading should contains "Thêm mới Số răng" inner Text
    Then Confirm adding "/code-types/NUMBER_OF_TEETH" page
    Then Webpage should contain "Tiêu đề" input field
    Then Webpage should contain "Thứ tự" input field
    Then Webpage should contain "Mã" input field
    Then Webpage should contain "Mô tả" input field

CT_09 Create new data with "Nhóm thủ thuật" the valid data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_10 Create new data with "Độ khó" the valid data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_11 Create new data with "Bằng cấp chuyên môn" the valid data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_12 Create new data with "Số răng" the valid data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_13 Check the update of "Nhóm thủ thuật" data list after creating a new data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_14 Check the update of "Độ khó" data list after creating a new data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_15 Check the update of "Bằng cấp chuyên môn" data list after creating a new data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_16 Check the update of "Số răng" data list after creating a new data
    [Tags]                                                                                        Create                                       Smoketest
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
## Create new data with blank field

CT_17 Create a new data with all blank fields
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line 
    When Click "Thêm mới" button
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_18 Create a new data when leaving "Tiêu đề" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field

CT_19 Create a new data when leaving "Mã" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_20 Verify that CAN create a new data when leaving a blank field in "Thứ tự"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_21 Verify that CAN create a new data when leaving a blank field in "Mô tả"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
CT_22 Create a new data with all blank fields
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Độ khó" item line 
    When Click "Thêm mới" button
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_23 Create a new data when leaving "Tiêu đề" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field

CT_24 Create a new data when leaving "Mã" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_25 Verify that CAN create a new data when leaving a blank field in "Thứ tự"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_26 Verify that CAN create a new data when leaving a blank field in "Mô tả"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Độ khó" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_27 Create a new data with all blank fields
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_28 Create a new data when leaving "Tiêu đề" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field

CT_29 Create a new data when leaving "Mã" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_30 Verify that CAN create a new data when leaving a blank field in "Thứ tự"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_31 Verify that CAN create a new data when leaving a blank field in "Mô tả"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Bằng cấp chuyên môn" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_32 Create a new data with all blank fields
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_33 Create a new data when leaving "Tiêu đề" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field

CT_34 Create a new data when leaving "Mã" field blank
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_35 Verify that CAN create a new data when leaving a blank field in "Thứ tự"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_36 Verify that CAN create a new data when leaving a blank field in "Mô tả"
    [Tags]                                            Create                                                               BlankField 
    Go to "Danh mục" page
    Select on the "Số răng" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "text" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

## Create new data with invalid data
CT_37 Create a new data with the existence of "Mã"
    [Tags]                                                                                        Create                                       Invalid
    Create a test data with "Nhóm thủ thuật" type
    Select on the "Nhóm thủ thuật" item line
    When Click "Thêm mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "word" in "Mã" with "_@Mã@_"
    When Click "Lưu lại" button
    Then User look message "Code đã tồn tại" popup

## Verify the go back function of buttons in Creating data page
CT_38 Verify the "Đóng lại" button
    [Tags]                                              Create                                                           Button
    Create a test data with "Nhóm thủ thuật" type
    Select on the "Nhóm thủ thuật" item line
    Click "Thêm mới" button
    When Click "Đóng lại" button
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Heading of separated group should contain "Nhóm thủ thuật" inner Text
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database

CT_39 Verify the left arrow icon ("Trở lại" button)
    [Tags]                                              Create                                                           Button
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    Click "Thêm mới" button
    When Click on the left arrow icon
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Heading of separated group should contain "Nhóm thủ thuật" inner Text
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database

CT_40 Verify the "Trở lại" (left arrow icon) button
    [Tags]                                              Create                                                           Button
    Go to "Danh mục" page
    Select on the "Nhóm thủ thuật" item line
    Click "Thêm mới" button
    When Click "Trở lại" button
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Heading of separated group should contain "Nhóm thủ thuật" inner Text
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database

## Verify the funtion of changing data information
CT_41 Verify the changing "Tiêu đề" field
    [Tags]                                                        ChangeInfo 
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_42 Verify the changing "Thứ tự" field
    [Tags]                                                        ChangeInfo 
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_43 Verify the changing "Mã" field
    [Tags]                                                        ChangeInfo 
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_44 Verify the changing "Mô tả" field
    [Tags]                                                        ChangeInfo 
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then Data's information in "Mô tả" should be equal "_@Mô tả@_"

## Verify the go back function of buttons in change information's page
CT_45 Check the "Đóng lại" button in edit infomation page
    [Tags]                                                                   ChangeInfo                                                   Button
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click "Đóng lại" button
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database
    Then "Nhóm thủ thuật" item line should be highlighted
    Then "_@Tiêu đề@_" table line should be highlighted
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_46 Check the left arrow icon ("Trở lại" button) in edit infomation page
    [Tags]                                                                   ChangeInfo                                                   Button
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "_@Tiêu đề@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click on the left arrow icon
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database
    Then "Nhóm thủ thuật" item line should be highlighted
    Then "_@Tiêu đề@_" table line should be highlighted
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    
CT_47 Check the "Trở lại" (left arrow icon) button in edit infomation page
    [Tags]                                                                   ChangeInfo                                                   Button
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click "Trở lại" button
    Then Confirm locating exactly in "Danh mục" page
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database
    Then "Nhóm thủ thuật" item line should be highlighted
    Then "_@Tiêu đề@_" table line should be highlighted
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
## Verify the User Interface of detail information's page
CT_48 Verify that navigating to the right "edit data" page
    [Tags]                                                                                   DetailedInfo
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Heading of separated group should contain "Loại danh mục" inner Text
    Then "Nhóm thủ thuật" should be visible in item line
    Then "Độ khó" should be visible in item line
    Then "Bằng cấp chuyên môn" should be visible in item line
    Then "Số răng" should be visible in item line
    Then Heading of separated group should contain "Nhóm thủ thuật" inner Text
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới" button
    Then Webpage should contains the list data from database
    Then "Nhóm thủ thuật" item line should be highlighted
    Then "_@Tiêu đề@_" table line should be highlighted
    When Click "Trở lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

CT_49 Check data information after creation
    [Tags]                                                                                   DetailedInfo
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Data's information in "Tiêu đề" should be equal "_@Tiêu đề@_"
    Then Data's information in "Thứ tự" should be equal "_@Thứ tư@_"
    Then Data's information in "Mã" should be equal "_@Mã@_"
    Then Data's information in "Mô tả" should be equal "_@Mô tả@_"
    When Click "Trở lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line

## Verify the delete data type function
CT_50 Verify the delete data function "Nhóm thủ thuật"
    [Tags]                                                                               Delete
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    Then "_@Tiêu đề@_" should not be visible in item line

CT_51 Verify the delete data function "Độ khó"
    [Tags]                                                                               Delete
    Create a test data with "Độ khó" type
    When Select on the "Độ khó" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    Then "_@Tiêu đề@_" should not be visible in item line

CT_52 Verify the delete data function "Bằng cấp chuyên môn"
    [Tags]                                                                               Delete
    Create a test data with "Bằng cấp chuyên môn" type
    When Select on the "Bằng cấp chuyên môn" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    Then "_@Tiêu đề@_" should not be visible in item line

CT_53 Verify the delete data function "Số răng"
    [Tags]                                                                               Delete
    Create a test data with "Số răng" type
    When Select on the "Số răng" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup
    Then "_@Tiêu đề@_" should not be visible in item line

CT_54 Verify the cancel action button when delete data "Nhóm thủ thuật"
    [Tags]                                                                               Delete
    Create a test data with "Nhóm thủ thuật" type
    When Select on the "Nhóm thủ thuật" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line with cancel
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup

CT_55 Verify the cancel action button when delete data "Độ khó"
    [Tags]                                                                               Delete
    Create a test data with "Độ khó" type
    When Select on the "Độ khó" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line with cancel
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup

CT_56 Verify the cancel action button when delete data "Bằng cấp chuyên môn"
    [Tags]                                                                               Delete
    Create a test data with "Bằng cấp chuyên môn" type
    When Select on the "Bằng cấp chuyên môn" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line with cancel
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup

CT_57 Verify the cancel action button when delete data "Số răng"
    [Tags]                                                                               Delete
    Create a test data with "Số răng" type
    When Select on the "Số răng" item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line with cancel
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    Then User look message "Đã xóa thành công" popup

*** Keywords ***
Go to "${page}" page
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    ${cnt}=    Get Length    ${page}
    IF    ${cnt} > 0 and '${page}' == 'Danh mục'
        Click "Danh mục" sub menu to "/code-types"
    END
Go to page create data "${name}" with "${url}"
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    Click "Danh mục" sub menu to "/code-types"
    IF    '${url}' == '/MEDICAL_PROCEDURE_GROUP'
        Select on the "Nhóm thủ thuật" item line
    ELSE IF    '${url}' == '/MEDICAL_PROCEDURE_DIFFICULTY'
        Select on the "Độ khó" item line
    ELSE IF    '${url}' == '/MEDICAL_DEGRE'
        Select on the "Bằng cấp chuyên môn" item line
    ELSE IF    '${url}' == '/NUMBER_OF_TEETH'
        Select on the "Số răng" item line
    END
    Click "Thêm mới" button
Create a test data with "${type}" type
   ${condition}=    Run Keyword And Return Status    Confirm locating exactly in "Danh mục" page
    IF    '${condition}' == 'True'
        Select on the "${type}" item line
        Click "Thêm mới" button
    ELSE
        IF    '${type}' == 'Nhóm thủ thuật'
            Go to page create data "Danh mục" with "/MEDICAL_PROCEDURE_GROUP"
        END
        IF    '${type}' == 'Độ khó'
            Go to page create data "Danh mục" with "/MEDICAL_PROCEDURE_DIFFICULTY"
        END
        IF    '${type}' == 'Bằng cấp chuyên môn'
            Go to page create data "Danh mục" with "/MEDICAL_DEGRE"
        END
        IF    '${type}' == 'Số răng'
            Go to page create data "Danh mục" with "/NUMBER_OF_TEETH"
        END
    END
    Enter "test name" in "Tiêu đề" with "_RANDOM_"
    ${text}=    Check Text    _@Tiêu đề@_
    ${name}=    Set Variable    ${text}
    Enter "number" in "Thứ tự" with "_RANDOM_"
    Enter "word" in "Mã" with "_RANDOM_"
    Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    Click "Lưu lại" button
    User look message "Success" popup
    RETURN    ${name}
Go to page create code-types "${name}" with "${url}"
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    Click "${name}" sub menu to "${url}"
    Click "Thêm mới" button
