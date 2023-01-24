*** Variables ***
${cmp1}           7
${cmp2}           5

*** Keywords ***
Compare2Var
    Should Be Equal As Integers    ${cmp1}    ${cmp2}
