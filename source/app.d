import std.stdio;
import std.conv;
import derelict.glfw3;
import derelict.opengl;

mixin glFreeFuncs!(GLVersion.gl45);

void main()
{
	DerelictGL3.load();
	scope(exit) DerelictGL3.unload();

	DerelictGLFW3.load();
	scope(exit) DerelictGLFW3.unload();

	glfwInit();
	scope(exit) glfwTerminate();

	auto window = glfwCreateWindow(640, 480, "Hello GLFW3", null, null);
	glfwMakeContextCurrent(window);

	auto loaded = DerelictGL3.reload();
	writeln(loaded);

	while (!glfwWindowShouldClose(window))
	{
		glClear(GL_COLOR_BUFFER_BIT);
		glfwSwapBuffers(window);
		glfwPollEvents();
	}
}
