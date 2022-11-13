import { render } from "@testing-library/react";
import TopNavBar from "./TopNavBar/topNavBar";

test("renders without crashing", () => {
  render(<TopNavBar />);
});
