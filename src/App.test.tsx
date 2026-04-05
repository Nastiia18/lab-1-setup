import { render, screen } from "@testing-library/react";
import App from "./App";

test("renders heading 'Get started'", () => {
  render(<App />);
  expect(screen.getByText(/Get started/i)).toBeInTheDocument();
});

test("renders counter button", () => {
  render(<App />);
  const button = screen.getByRole("button");
  expect(button).toBeInTheDocument();
});
