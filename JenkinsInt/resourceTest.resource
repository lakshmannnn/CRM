*** Variables ***
${cmp1}           5
${cmp2}           5

*** Keywords ***
Compare2Var
    Should Be Equal As Integers    ${cmp1}    ${cmp2}
