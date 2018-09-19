count=$(acpi -b | wc -l)
sum=$(acpi -b | grep -Eo '[0-9]{1,3}%' | tr -d '%' | xargs | sed -e 's/ /+/g' | bc)
echo $((sum / count))%
