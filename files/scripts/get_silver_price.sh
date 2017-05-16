#!/bin/bash
ag_price=$(curl --silent http://www.apmex.com/spotprices/silver-prices | grep -Po -m 1 '\$\d{2}\.\d{2}') 
echo $ag_price



