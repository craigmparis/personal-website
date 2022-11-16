import { render, screen } from "@testing-library/react";
import App from "./App";

test("renders without crashing", () => {
  render(<App />);
});

test("A navigation header is displayed", () => {
  render(<App />);

  const navigation = screen.getByRole("navigation");

  expect(navigation).toBeVisible();
});
