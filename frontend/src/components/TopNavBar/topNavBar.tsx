import styled from "styled-components";

const Container = styled.div<{ name?: string }>``;

export default function TopNavBar(): JSX.Element {
  return <Container aria-label="Main" name="top-navbar" role="navigation" />;
}
