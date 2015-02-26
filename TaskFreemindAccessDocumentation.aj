package ajmu;

public aspect TaskFreemindAccessDocumentation extends TaskAccessDocumentation {
	pointcut accessDocumentation():execution(void freemind.controller.Controller.DocumentationAction.actionPerformed(..));
}
