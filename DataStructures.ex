
#Bloque dónde creamos nuestra función contador. Recibe un texto como parámetro al cual le quitamos mayúsculas, luego reemplazamos todo lo que no sea letras
#incluyendo espacios y lo eliminamos. Luego separa las palabras en una lista y las va añadiendo a un mapa.
defmodule ContadorPalabras do
  def contar(texto) do
    texto
    |> String.downcase()
    |> String.replace(~r/[^\p{L}\s]/u, "")
    |> String.split()
    |> Enum.reduce(%{}, fn palabra, acc ->
      Map.update(acc, palabra, 1, &(&1 + 1))
    end)
  end

  #Además tenemos la función que maneja la lectura a través de un archivo de texto. Lo lee y llama a la función contar a su contenido. De
  #no poder leerlo entonces muestra el error.
  def contar_desde_archivo(nombre_archivo) do
    case File.read(nombre_archivo) do
      {:ok, contenido} ->
        contar(contenido)

      {:error, motivo} ->
        IO.puts("Error al leer el archivo: #{motivo}")
        %{}
    end
  end

  #Por último la función que recorre el mapa para ir imprimiendo el conteo.
  def imprimir(conteo) do
    Enum.each(conteo, fn {palabra, cantidad} ->
      IO.puts("#{palabra}: #{cantidad}")
    end)
  end
end

#Ejemplo de uso SINGULAR
conteo = ContadorPalabras.contar("Aquí debería haber 4 palabras.\n\n\n")
ContadorPalabras.imprimir(conteo)

#Espacios para diferenciar conteos.
IO.puts("\n\n\n")

#Ejemplo del lector (creamos otra variable conteo para no llamar a la de arriba).
conteo2 = ContadorPalabras.contar_desde_archivo("TextoEjemplo.txt")
ContadorPalabras.imprimir(conteo2)
