
#Bloque dónde creamos nuestra función contador. Recibe un texto como parámetro al cual le quitamos mayúsculas, luego reemplazamos todo lo que no sea letras
#incluyendo espacios y lo eliminamos. Luego separa las palabras en una lista y las va añadiendo a un mapa
defmodule ContadorPalabras do
  def contar(texto) do
    texto
    |> String.downcase()
    |> String.replace(~r/[^\p{L}\s]/u, "")
    |> String.split()
    |> Enum.reduce(%{}, fn palabra, palabraActual -> Map.update(palabraActual, palabra, 1, &(&1 + 1)) end) #Aquí es dónde iniciamos el mapa. Si no existe la añade, si sí suma 1.
  end
end

#Ejemplo de uso
