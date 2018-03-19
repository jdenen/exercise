defmodule SecretHandshake do
  import Enum, only: [zip: 2, flat_map: 2, reverse: 1]
  @acts [
    &SecretHandshake.wink/1,
    &SecretHandshake.blink/1,
    &SecretHandshake.close/1,
    &SecretHandshake.jump/1
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Integer.digits(code, 2)
    |> shake
  end

  def wink(0),  do: []
  def wink(1),  do: ["wink"]
  def blink(0), do: []
  def blink(1), do: ["double blink"]
  def close(0), do: []
  def close(1), do: ["close your eyes"]
  def jump(0),  do: []
  def jump(1),  do: ["jump"]

  defp shake([e]), do: make zip(@acts, [e])
  defp shake([d, e]), do: make zip(@acts, [e, d])
  defp shake([c, d, e]), do: make zip(@acts, [e, d, c])
  defp shake([b, c, d, e]), do: make zip(@acts, [e, d, c, b])
  defp shake([1, b, c, d, e]), do: make zip(reverse(@acts), [b, c, d, e])
  defp shake(_), do: []

  defp make(funs), do: flat_map(funs, fn {f, n} -> f.(n) end)
end
