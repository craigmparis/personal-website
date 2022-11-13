import styled from "styled-components";

const Container = styled.div<{ name?: string }>``;

export default function TopNavBar() {
  return <Container name="top-navbar" role="navigation" aria-label="Main" />;
}
