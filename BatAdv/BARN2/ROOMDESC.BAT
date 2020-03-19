if %look%PLUK==PLUK goto cnot
echo You can see clearly enough to avoid the cobwebs. It's a good thing you
echo kept that torch. The barn is empty. 
goto end
:cnot
echo You get sticky from the cobwebs. You can't see a thing without light.
echo You wished you had a torch or something like that. (%BLINK%%FR%hint hint%RS%%FY%)
:end
