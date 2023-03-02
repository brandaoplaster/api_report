defmodule ApiReport.ErrorHandling.ErrorTest do
  use ApiReport.DataCase

  alias ApiReport.ErrorHandling.Error

  describe "error" do
    test "build/2 with valid params" do
      expected = %Error{status: 200, message: "Created"}
      assert Error.build(200, "Created") == expected
    end
  end
end
