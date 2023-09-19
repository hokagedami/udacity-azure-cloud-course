import click


@click.command(help("This tool greets you."))
@click.option("--name", default="World", help="Who to greet.")
@click.option("--color", default="red", help="What color to use.")
def hello(name, color):
    if name == "Thor":
        click.echo(f"Hello, Thor! Your color is {color}.")
        click.echo(click.style("Hello, {}! Your colour is {}".format(name, color), fg="red"))
    else:
        pass



if __name__ == "__main__":
    hello()